package com.fpoly.duantotnghiep.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collections;

@Service
public class TwitchService {

    private static final String CLIENT_ID = "q3obcu40tu3jcd95s5jp461j6h1181"; // Replace with your Twitch Client ID
    private static final String CLIENT_SECRET = "t1kn1t6o9x6p4zc9wgjqjq3d4i04n9\r\n" + //
            ""; // Replace with your Twitch Client Secret
    private static final String TWITCH_OAUTH_URL = "https://id.twitch.tv/oauth2/authorize";
    private static final String REDIRECT_URI = "http://localhost:8080/twitch/oauth2callback";
    private static final String TWITCH_API_BASE_URL = "https://api.twitch.tv/helix";
    private static final String TWITCH_SCOPES = "user:read:email+channel:manage:videos+channel:read:subscriptions";

    private String accessToken;

    @Autowired
    private CookieService cookieService;

    @Autowired
    private RestTemplate restTemplate;

    public TwitchService() {
        // Initialize if needed
    }

    public String getAuthorizationUrl() {
        String authorizationUrl = TWITCH_OAUTH_URL + "?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI
                + "&response_type=code&scope=" + TWITCH_SCOPES;
        return authorizationUrl;
    }

    public String getAccessToken(String authorizationCode) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Client-ID", CLIENT_ID);
        headers.set("Client-Secret", CLIENT_SECRET);
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<String> request = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(
                TWITCH_API_BASE_URL + "/oauth2/token?client_id=" + CLIENT_ID +
                        "&client_secret=" + CLIENT_SECRET +
                        "&code=" + authorizationCode +
                        "&grant_type=authorization_code" +
                        "&redirect_uri=" + REDIRECT_URI,
                HttpMethod.POST,
                request,
                String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            // Parse the JSON response to get the access token
            ObjectMapper mapper = new ObjectMapper();
            JsonNode responseJson = mapper.readTree(response.getBody());
            accessToken = responseJson.get("access_token").asText();
        } else {
            throw new IOException("Failed to obtain access token from Twitch.");
        }

        return accessToken;
    }

    public void uploadVideo(String title, String description, String privacyStatus, MultipartFile file,
            String accessToken)
            throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Client-ID", CLIENT_ID);
        headers.set("Authorization", "Bearer " + accessToken);
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Xây dựng requestBody để tải lên video
        // Ví dụ, bạn cần xác định các thông tin như title, description, privacyStatus,
        // và nội dung video.
        // Sử dụng ObjectMapper để chuyển đổi dữ liệu thành chuỗi JSON để gửi đi.

        ObjectMapper mapper = new ObjectMapper();
        ObjectNode requestBody = mapper.createObjectNode();
        requestBody.put("title", title);
        requestBody.put("description", description);
        requestBody.put("privacyStatus", privacyStatus);
        // Chuyển đổi MultipartFile thành dữ liệu dạng byte[] hoặc InputStream và thêm
        // vào requestBody nếu cần.

        // Convert the requestBody to a JSON string
        String requestBodyJson = requestBody.toString();

        HttpEntity<String> request = new HttpEntity<>(requestBodyJson, headers);

        ResponseEntity<String> response = restTemplate.exchange(
                TWITCH_API_BASE_URL + "/videos",
                HttpMethod.POST,
                request,
                String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            // Xử lý phản hồi thành công khi tải lên video
        } else {
            throw new IOException("Failed to upload video to Twitch.");
        }
    }

    // Other methods if needed

}
