package cloudinary;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import cloudinary.CloudinaryConfig;

import java.io.IOException;
import java.util.Map;

public class CloudinaryService {

    private final Cloudinary cloudinary;

    public CloudinaryService() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    public String getImageUrlAfterUpload(byte[] file, String folder) throws IOException {
        Map uploadResult = cloudinary.uploader().upload(file,
                ObjectUtils.asMap(
                        "folder", folder
                ));
        return (String) uploadResult.get("url");
    }
}