package ru.lonelyelk.jarquine;

import javax.tools.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Arrays;

public class ShaQuine {
    private static String dotRegexp = new String(new char[] { 92, 46 });

    static class JavaByteObject extends SimpleJavaFileObject {
        private ByteArrayOutputStream outputStream;

        protected JavaByteObject(String name) throws URISyntaxException {
            super(URI.create("bytes:///"+name + name.replaceAll(dotRegexp, "/")), Kind.CLASS);
            outputStream = new ByteArrayOutputStream();
        }

        @Override
        public OutputStream openOutputStream() throws IOException {
            return outputStream;
        }

        public byte[] getBytes() {
            return outputStream.toByteArray();
        }
    }

    static class JavaStringObject extends SimpleJavaFileObject {
        private final String source;

        protected JavaStringObject(String name, String source) {
            super(URI.create("string:///" + name.replaceAll(dotRegexp, "/") +
                    Kind.SOURCE.extension), Kind.SOURCE);
            this.source = source;
        }

        @Override
        public CharSequence getCharContent(boolean ignoreEncodingErrors)
                throws IOException {
            return source;
        }
    }

    public static void main(String[] args) {
        try {
            String className = "ShaQuine";
            final JavaByteObject byteObject = new JavaByteObject(className);
            DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            StandardJavaFileManager standardFileManager =
                    compiler.getStandardFileManager(diagnostics, null, Charset.defaultCharset());
            JavaFileManager fileManager = createFileManager(standardFileManager, byteObject);
            JavaCompiler.CompilationTask task =
                    compiler.getTask(null, fileManager, diagnostics, null, null, getCompilationUnits(className));

            if(task.call()) {
                fileManager.close();
                final byte [] hash = MessageDigest.getInstance("SHA-256").digest(byteObject.getBytes());
                final StringBuilder hashBuilder = new StringBuilder(hash.length);

                for (byte b : hash)
                    hashBuilder.append(Integer.toHexString(255 & b));
                System.out.println(hashBuilder.toString());
                final ClassLoader classLoader = createClassLoader(byteObject);
                Class<?> dummyClass = classLoader.loadClass("ru.lonelyelk.jarquine.ShaQuine");
                System.out.println(dummyClass.getMethod("getSource").invoke(dummyClass));
            } else {
                System.out.println("PROBLEM");
                diagnostics.getDiagnostics().forEach(System.out::println);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private static JavaFileManager createFileManager(StandardJavaFileManager fileManager,
                                                     JavaByteObject byteObject) {
        return new ForwardingJavaFileManager<StandardJavaFileManager>(fileManager) {
            @Override
            public JavaFileObject getJavaFileForOutput(Location location,
                                                       String className, JavaFileObject.Kind kind,
                                                       FileObject sibling) throws IOException {
                return byteObject;
            }
        };
    }

    private static ClassLoader createClassLoader(final JavaByteObject byteObject) {
        return new ClassLoader() {
            @Override
            public Class<?> findClass(String name) throws ClassNotFoundException {
                byte[] bytes = byteObject.getBytes();
                System.out.println(bytes.length);
                return defineClass(name, bytes, 0, bytes.length);
            }
        };
    }

    public static Iterable<? extends JavaFileObject> getCompilationUnits(String className) {
        JavaStringObject stringObject =
                new JavaStringObject(className, getSource());
        return Arrays.asList(stringObject);
    }

    public static String getSource() {
        char quote = '"';
        String template =
                """
package ru.lonelyelk.jarquine;

import javax.tools.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Arrays;

public class ShaQuine {
    private static String dotRegexp = new String(new char[] { 92, 46 });

    static class JavaByteObject extends SimpleJavaFileObject {
        private ByteArrayOutputStream outputStream;

        protected JavaByteObject(String name) throws URISyntaxException {
            super(URI.create("bytes:///"+name + name.replaceAll(dotRegexp, "/")), Kind.CLASS);
            outputStream = new ByteArrayOutputStream();
        }

        @Override
        public OutputStream openOutputStream() throws IOException {
            return outputStream;
        }

        public byte[] getBytes() {
            return outputStream.toByteArray();
        }
    }

    static class JavaStringObject extends SimpleJavaFileObject {
        private final String source;

        protected JavaStringObject(String name, String source) {
            super(URI.create("string:///" + name.replaceAll(dotRegexp, "/") +
                    Kind.SOURCE.extension), Kind.SOURCE);
            this.source = source;
        }

        @Override
        public CharSequence getCharContent(boolean ignoreEncodingErrors)
                throws IOException {
            return source;
        }
    }

    public static void main(String[] args) {
        try {
            String className = "ShaQuine";
            final JavaByteObject byteObject = new JavaByteObject(className);
            DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            StandardJavaFileManager standardFileManager =
                    compiler.getStandardFileManager(diagnostics, null, Charset.defaultCharset());
            JavaFileManager fileManager = createFileManager(standardFileManager, byteObject);
            JavaCompiler.CompilationTask task =
                    compiler.getTask(null, fileManager, diagnostics, null, null, getCompilationUnits(className));

            if(task.call()) {
                fileManager.close();
                final byte [] hash = MessageDigest.getInstance("SHA-256").digest(byteObject.getBytes());
                final StringBuilder hashBuilder = new StringBuilder(hash.length);

                for (byte b : hash)
                    hashBuilder.append(Integer.toHexString(255 & b));
                System.out.println(hashBuilder.toString());
                final ClassLoader classLoader = createClassLoader(byteObject);
                Class<?> dummyClass = classLoader.loadClass("ru.lonelyelk.jarquine.ShaQuine");
                System.out.println(dummyClass.getMethod("getSource").invoke(dummyClass));
            } else {
                System.out.println("PROBLEM");
                diagnostics.getDiagnostics().forEach(System.out::println);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private static JavaFileManager createFileManager(StandardJavaFileManager fileManager,
                                                     JavaByteObject byteObject) {
        return new ForwardingJavaFileManager<StandardJavaFileManager>(fileManager) {
            @Override
            public JavaFileObject getJavaFileForOutput(Location location,
                                                       String className, JavaFileObject.Kind kind,
                                                       FileObject sibling) throws IOException {
                return byteObject;
            }
        };
    }

    private static ClassLoader createClassLoader(final JavaByteObject byteObject) {
        return new ClassLoader() {
            @Override
            public Class<?> findClass(String name) throws ClassNotFoundException {
                byte[] bytes = byteObject.getBytes();
                System.out.println(bytes.length);
                return defineClass(name, bytes, 0, bytes.length);
            }
        };
    }

    public static Iterable<? extends JavaFileObject> getCompilationUnits(String className) {
        JavaStringObject stringObject =
                new JavaStringObject(className, getSource());
        return Arrays.asList(stringObject);
    }

    public static String getSource() {
        char quote = '"';
        String template =
                %c%c%c
%s
                %c%c%c.trim();
       return template.formatted(quote, quote, quote, template, quote, quote, quote);
   }
}
                """.trim();
        return template.formatted(quote, quote, quote, template, quote, quote, quote);
    }
}
