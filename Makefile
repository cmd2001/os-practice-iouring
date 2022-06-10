test: clean cat_liburing cat_regular
	@echo "genertating test file"
	@tr -dc A-Za-z0-9 </dev/urandom | head -c 1024 > data.txt
	@echo "measuring regular"
	@time ./cat_regular ./data.txt
	@echo "measuring liburing"
	@time ./cat_liburing ./data.txt
cat_liburing: src/cat_liburing.c
	gcc src/cat_liburing.c /usr/lib/liburing.so -o cat_liburing
cat_regular: src/cat_regular.c
	gcc src/cat_regular.c -o cat_regular
clean:
	rm -f cat_liburing cat_regular data.txt