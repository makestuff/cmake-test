#!/bin/sh
cd ~/.vscode-remote/extensions/davidschuldenfrei.gtest-adapter-1.8.3
patch -p0 <<EOF
diff -r -U1 old/ConfigUtils.js out/ConfigUtils.js
--- out/ConfigUtils.js	2019-04-03 10:27:04.000000000 +0100
+++ out/ConfigUtils.js	2020-11-04 17:08:11.227202544 +0000
@@ -41,3 +41,3 @@
     static getDebugProgram(debugConfig) {
-        let program = debugConfig.program;
+        let program = debugConfig.target;
         const platform = getPlatform();
diff -r -U1 old/GTestWrapper.js out/GTestWrapper.js
--- out/GTestWrapper.js	2019-04-03 10:27:04.000000000 +0100
+++ out/GTestWrapper.js	2020-11-04 17:07:23.094393155 +0000
@@ -112,6 +112,6 @@
             if (vscode_1.workspace.workspaceFolders && debugConfig) {
-                if (!debugConfig.args) {
-                    debugConfig.args = [];
+                if (!debugConfig.arguments) {
+                    debugConfig.arguments = [];
                 }
-                debugConfig.args.push('--gtest_filter=' + testName);
+                debugConfig.arguments.push('--gtest_filter=' + testName);
                 debugConfig = Object.assign({}, debugConfig);
@@ -120,2 +120,3 @@
                 vscode_1.commands.executeCommand('workbench.view.debug');
+		debugConfig.arguments.pop();
             }
EOF
cd -
git submodule update --init
./build.sh
touch READY
