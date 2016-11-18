package com.zyfz.web.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by ron on 16-11-11.
 */
public class JsonView {
    public static ModelAndView Render(Object model, HttpServletResponse response)
    {
        MappingJacksonHttpMessageConverter jsonConverter = new MappingJacksonHttpMessageConverter();

        MediaType jsonMimeType = MediaType.APPLICATION_JSON;

       // MediaType mediaType = new MediaType("application/json;charset=utf-8");

        try {
            jsonConverter.write(model,  MediaType.parseMediaType("application/json;charset=utf-8"), new ServletServerHttpResponse(response));
        } catch (HttpMessageNotWritableException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
