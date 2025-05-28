package cloudinary;

import com.cloudinary.Cloudinary;
import io.github.cdimascio.dotenv.Dotenv;

public class CloudinaryConfig {
    private static Cloudinary cloudinary;

    public static Cloudinary getCloudinary() {
        Dotenv dotenv = Dotenv.configure()
                .ignoreIfMissing()
                .load();
        String cloudinaryUrl = dotenv.get("CLOUDINARY_URL");
        if (cloudinaryUrl == null || cloudinaryUrl.isEmpty()) {
            throw new IllegalStateException("CLOUDINARY_URL is missing in .env file");
        }
        cloudinary = new Cloudinary(cloudinaryUrl);
        return cloudinary;
    }
}
