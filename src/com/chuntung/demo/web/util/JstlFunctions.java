package com.chuntung.demo.web.util;

import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * Define the JSTL functions.
 * 
 * @author tonyho
 *
 */
public class JstlFunctions {
	/**
	 * Test if the given item exits in the collection.
	 * 
	 * @param item
	 *            search item
	 * @param collection
	 *            an array/set/map or iterable collection
	 * @return true if the item exists
	 */
	public static boolean exists(Object item, Object collection) {
		if (item == null || collection == null) {
			return false;
		}

		if (collection.getClass().isArray()) {
			Object[] items = (Object[]) collection;
			for (Object var : items) {
				if (var.equals(item)) {
					return true;
				}
			}
		} else if (collection instanceof Set) {
			return ((Set<?>) collection).contains(item);
		} else if (collection instanceof Map) {
			return ((Map<?, ?>) collection).containsKey(item);
		} else if (collection instanceof Iterable<?>) {
			for (Object var : (Iterable<?>) collection) {
				if (var.equals(item)) {
					return true;
				}
			}
		} else {
			return item.equals(collection);
		}

		return false;
	}

	/**
	 * Get the fingerprint of given file under WebContent path.
	 * 
	 * @param path
	 * @param request
	 * @return
	 */
	public static String getFingerprint(String path, ServletContext context) {
		return WebUtil.getFingerprint(path, context);
	}

	/**
	 * Get current locale.
	 * 
	 * @param request
	 * @return
	 */
	public static Locale getLocale(HttpServletRequest request) {
		return WebUtil.getLocale(request);
	}
}
