package org.example.client.entity;

import com.alibaba.fastjson2.JSONObject;

public record Response(int id, int code, Object data, String message) {

    public boolean success() {
        return code == 200;
    }

    public JSONObject asJson() {
        return JSONObject.from(data);
    }

    public static Response errorResponse(Exception e) {
        return new Response(0, 500, null, e.getMessage());
    }

}

