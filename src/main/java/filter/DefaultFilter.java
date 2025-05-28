package filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DefaultFilter implements Filter {

    private FilterConfig filterConfig = null;
    private static final boolean debug = true;

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (debug) {
            log("DefaultFilter: Initializing filter");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("DefaultFilter: doFilter()");
        }

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String url = httpRequest.getServletPath();

        if ("/".equals(url)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return; // Ngăn không cho đi tiếp nếu đã redirect
        }

        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            problem = t;
            t.printStackTrace();
        }

        if (problem != null) {
            if (problem instanceof ServletException) throw (ServletException) problem;
            if (problem instanceof IOException) throw (IOException) problem;
            sendProcessingError(problem, response);
        }
    }

    @Override
    public void destroy() {
        if (debug) {
            log("DefaultFilter: Destroying filter");
        }
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);
        try {
            response.setContentType("text/html");
            PrintWriter pw = new PrintWriter(response.getOutputStream());
            pw.println("<html><head><title>Error</title></head><body>");
            pw.println("<h1>The resource did not process correctly</h1>");
            pw.println("<pre>" + stackTrace + "</pre>");
            pw.println("</body></html>");
            pw.close();
        } catch (IOException ignored) {
        }
    }

    public static String getStackTrace(Throwable t) {
        try (StringWriter sw = new StringWriter(); PrintWriter pw = new PrintWriter(sw)) {
            t.printStackTrace(pw);
            return sw.toString();
        } catch (IOException ex) {
            return null;
        }
    }

    private void log(String msg) {
        if (filterConfig != null) {
            filterConfig.getServletContext().log(msg);
        }
    }
}
