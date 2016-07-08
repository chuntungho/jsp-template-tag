# jsp-template-tag

Implements view template and custom tags using JSP 2.0 tag file.

## Template tags

Define a template with `resources` and `content` attributes, the 
calling JSP just need to set the jsp attributes.

- layout:base, the basic html template.

- layout:standalone, used for standalone page, e.g. sign in page, not found page.

- layout:nested, contains bread crumbs and navigation, used for signed in pages.

## Custom Tags

- tags:i18n, implement i18n using fmt:message.

- tags:resource, import css or js with fingerprint to avoid browser cache.

- tags:link, render a link instead of using <c:url>.

- tags:datagrid/tags:column, render a table by defined columns.

- tags:pagination, render pagination, depends on jQuery to jump page.

- tags:buttonGroup, render radio or checkbox.

- tags:options, render select options.
