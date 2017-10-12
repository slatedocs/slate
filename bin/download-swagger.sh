#! /bin/sh

rm -rf source/swagger && mkdir -p source/swagger
curl -L https://github.com/swagger-api/swagger-ui/archive/master.tar.gz | tar -C source/swagger --strip-components 2 -zxv swagger-ui-master/dist 
patch -p1 -d source/swagger << EOF
diff -u swagger/index.html swagger/index.html
--- swagger/index.html	2017-10-12 11:28:47.000000000 +0530
+++ swagger/index.html	2017-10-11 06:23:11.000000000 +0530
@@ -74,7 +74,7 @@

   // Build a system
   const ui = SwaggerUIBundle({
-    url: "http://petstore.swagger.io/v2/swagger.json",
+    url: "https://itsman.quintype.com/sketches-swagger.json",
     dom_id: '#swagger-ui',
     deepLinking: true,
     presets: [
EOF
