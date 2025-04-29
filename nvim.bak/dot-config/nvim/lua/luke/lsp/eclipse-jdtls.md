# Eclipse JDT Language Server

## Installation Instructions

https://github.com/eclipse-jdtls/eclipse.jdt.ls#installation

```java
java \
	-Declipse.application=org.eclipse.jdt.ls.core.id1 \
	-Dosgi.bundles.defaultStartLevel=4 \
	-Declipse.product=org.eclipse.jdt.ls.core.product \
	-Dlog.level=ALL \
	-Xmx1G \
	--add-modules=ALL-SYSTEM \
	--add-opens java.base/java.util=ALL-UNNAMED \
	--add-opens java.base/java.lang=ALL-UNNAMED \
	-jar ./plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar \
	-configuration ./config_linux \
	-data /path/to/data
```

    Choose a value for -configuration: this is the path to your platform's configuration directory. For Linux, use ./config_linux. For windows, use ./config_win. For mac/OS X, use ./config_mac.
    Change the filename of the jar in -jar ./plugins/... to match the version you built or downloaded.
    Choose a value for -data: An absolute path to your data directory. eclipse.jdt.ls stores workspace specific information in it. This should be unique per workspace/project.

If you want to debug eclipse.jdt.ls itself, add -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 right after java and ensure nothing else is running on port 1044. If you want to debug from the start of execution, change suspend=n to suspend=y so the JVM will wait for your debugger prior to starting the server.

## Clients

This repository only contains the server implementation. Here are some known clients consuming this server:

    vscode-java : an extension for Visual Studio Code
    ide-java : an extension for Atom
    ycmd : a code-completion and code-comprehension server for multiple clients
    Oni : modern modal editing - powered by Neovim.
    LSP Java : a Java LSP client for Emacs
    Eclipse Theia : Theia is a cloud & desktop IDE framework implemented in TypeScript
    Eclipse IDE JDT.LS : an extension for Eclipse IDE
    coc-java : an extension for coc.nvim
    MS Paint IDE : an IDE for programming in MS Paint
    nvim-jdtls : an extension for Neovim
    multilspy from monitors4codegen : A language-agnostic LSP client in Python, with a library interface. Intended to be used to build applications around language servers
    OpenSumi : A framework that helps you quickly build Cloud or Desktop IDE products.
