package com.fpoly.duantotnghiep.Controller;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.FileEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

@RestController
public class VimeoController {

    private final String clientId = "eb72077b79fa2def428dbef14a843c3cf82f3e02";
    private final String clientSecret = "sn6L/U83pqM9ZgB5w2BUviNpHwOAuYUFn5kbQUPXu0vkvSVT8hORb1LwekqWaeDV0QEwpVWwe8wTC3YRHP+81OqtEvcSZRxlFw/z4tknJI2/0wHu4gnZxkMHtHGNVP/E";

    @PostMapping("/api/vimeo/upload")
    public ResponseEntity<String> uploadVideo(@RequestParam("file") MultipartFile file) {
        String accessToken = getAccessToken(clientId, clientSecret);
        if (accessToken != null) {
            try {
                // Use the accessToken to upload the video to Vimeo.
                String videoUri = uploadToVimeo(file, accessToken);
                return ResponseEntity.ok("Video uploaded successfully. URI: " + videoUri);
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("Error uploading video: " + e.getMessage());
            }
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to obtain access token.");
        }
    }

    private String getAccessToken(String clientId, String clientSecret) {
        String tokenUrl = "https://api.vimeo.com/oauth/authorize/client";
        String grantType = "client_credentials";

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost request = new HttpPost(tokenUrl);

            // Set headers
            String credentials = clientId + ":" + clientSecret;
            String base64Credentials = Base64.getEncoder().encodeToString(credentials.getBytes());
            request.setHeader(HttpHeaders.AUTHORIZATION, "Basic " + base64Credentials);
            request.setHeader(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded");

            // Set request body
            String requestBody = "grant_type=" + grantType;
            request.setEntity(new StringEntity(requestBody));

            HttpResponse response = httpClient.execute(request);
            int statusCode = response.getStatusLine().getStatusCode();
            HttpEntity responseEntity = response.getEntity();

            if (statusCode == 200) {
                JSONObject responseData = new JSONObject(EntityUtils.toString(responseEntity));
                String accessToken = responseData.getString("access_token");
                return accessToken;
            } else {
                System.out.print("Error getting access token. " + EntityUtils.toString(responseEntity));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    private String uploadToVimeo(MultipartFile file, String accessToken) {
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            File videoFile = convertMultipartFileToFile(file);
            HttpPost uploadRequest = new HttpPost("https://api.vimeo.com/me/videos");

            // Set headers
            uploadRequest.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);
            uploadRequest.setHeader(HttpHeaders.CONTENT_TYPE, "multipart/form-data");

            // Set video file
            FileEntity videoEntity = new FileEntity(videoFile, ContentType.create("video/mp4"));
            uploadRequest.setEntity(videoEntity);

            HttpResponse response = httpClient.execute(uploadRequest);
            int statusCode = response.getStatusLine().getStatusCode();
            HttpEntity responseEntity = response.getEntity();
            System.out.println("Status code: " + statusCode);

            if (statusCode == 201) {
                JSONObject responseData = new JSONObject(EntityUtils.toString(responseEntity));
                String videoUri = responseData.getString("uri");
                return videoUri;
            } else {
                System.out.println("Error uploading video. " + EntityUtils.toString(responseEntity));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
        File file = new File(multipartFile.getOriginalFilename());
        multipartFile.transferTo(file);
        return file;
    }
}
