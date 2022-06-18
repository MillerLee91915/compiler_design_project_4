all:
	java -cp ./antlr-3.5.2-complete.jar org.antlr.Tool myCompiler.g 
	javac -cp ./antlr-3.5.2-complete.jar myCompilerLexer.java myCompilerParser.java myCompiler_test.java
	java -cp ./antlr-3.5.2-complete.jar:. myCompiler_test test0.c > my_test0.ll
	java -cp ./antlr-3.5.2-complete.jar:. myCompiler_test test1.c > my_test1.ll
	java -cp ./antlr-3.5.2-complete.jar:. myCompiler_test test2.c > my_test2.ll
	clang -S -emit-llvm ./test0.c 
	clang -S -emit-llvm ./test1.c 
	clang -S -emit-llvm ./test2.c 
clean:
	rm -f myCompilerLexer.java myCompilerParser.java myCompiler.tokens *.class input.ll test*.ll my_test*.ll