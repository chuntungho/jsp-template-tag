package com.chuntung.demo.web.util;

import java.io.File;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * The unified utility for Web infrastructure
 * 
 * @author tonyho
 * 
 */
public class WebUtil {
	// web init parameters
	private static final String I18N_LOCALE_KEY_PARAM = "i18nLocaleKey";
	private static final String USER_KEY_PARAM = "currentUserKey";

	// default session keys
	private static final String DEFAULT_LOCALE_KEY = "_i18nLocale";
	private static final String DEFAULT_USER_KEY = "_currentUser";

	// request parameter
	private final static String REDIRECT_URL_PARAM = "_redirectUrl";
	public final static String DOWNLOAD_TOKEN_PARAM = "_downloadToken";

	// application scope
	private final static String FINGERPRINT_MAP_KEY = "APPLICATION_SCOPE_FINGERPRINT";

	private static Map<String, String> getFingerprintMap(ServletContext context) {
		@SuppressWarnings("unchecked")
		Map<String, String> fingerprintMap = (Map<String, String>) context.getAttribute(FINGERPRINT_MAP_KEY);
		if (fingerprintMap == null) {
			fingerprintMap = new ConcurrentHashMap<String, String>();
			context.setAttribute(FINGERPRINT_MAP_KEY, fingerprintMap);
		}
		return fingerprintMap;
	}

	public static String getFingerprint(String path, ServletContext context) {
		Map<String, String> fingerprintMap = getFingerprintMap(context);
		if (fingerprintMap.containsKey(path)) {
			return fingerprintMap.get(path);
		}

		String realPath = context.getRealPath(path);
		String fingerprint = null;
		if (realPath != null) {
			// get last modified when war was unpacked
			File f = new File(realPath);
			fingerprint = String.valueOf(f.lastModified());
		} else {
			// get resource md5
			try {
				// fingerprint =
				// DigestUtils.md5Hex(context.getResourceAsStream(path));
			} catch (Exception e) {
				context.log("Failed to gen fingerprint", e);
				// just set current date
				fingerprint = String.valueOf(new Date().getTime());
			}
		}
		fingerprintMap.put(path, fingerprint);

		return fingerprint;
	}

	public static void evictResource(String path, ServletContext context) {
		getFingerprintMap(context).remove(path);
	}

	public static String getRedirectUrl(HttpServletRequest request) {
		String url = request.getParameter(REDIRECT_URL_PARAM);
		if (url == null) {
			url = request.getHeader("Referer");
		}
		return url;
	}

	public static void sendCookieFromParameter(String param, HttpServletRequest request, HttpServletResponse response) {
		String token = request.getParameter(param);
		if (token != null) {
			Cookie cookie = new Cookie(param, token);
			response.addCookie(cookie);
		}
	}

	private static String getUserKey(HttpServletRequest request) {
		String key = request.getSession().getServletContext().getInitParameter(USER_KEY_PARAM);
		return key == null ? DEFAULT_USER_KEY : key;
	}

	public static String getCurrentUser(HttpServletRequest request) {
		return (String) request.getSession().getAttribute(getUserKey(request));
	}

	public static void setCurrentUser(HttpServletRequest request, String userId) {
		request.getSession().setAttribute(getUserKey(request), userId);
	}

	private static String getLocaleKey(HttpServletRequest request) {
		String localeKey = request.getSession().getServletContext().getInitParameter(I18N_LOCALE_KEY_PARAM);
		return localeKey == null ? DEFAULT_LOCALE_KEY : localeKey;
	}

	public static Locale getLocale(HttpServletRequest request) {
		Locale locale = (Locale) getSessionAttribute(request, getLocaleKey(request));
		if (locale == null) {
			locale = request.getLocale();
		}
		return locale;
	}

	public static void setLocale(HttpServletRequest request, Locale locale) {
		setSessionAttribute(request, getLocaleKey(request), locale);
	}

	public static void setSessionAttribute(HttpServletRequest request, String key, Object value) {
		request.getSession().setAttribute(key, value);
	}

	public static Object getSessionAttribute(HttpServletRequest request, String key) {
		return request.getSession().getAttribute(key);
	}
}
