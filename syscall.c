#include <sys/syscall.h>
#include <unistd.h>

int main() {
  // Calling the write() system call to write "Hello World" to the standard
  // output
  //
  // see: <https://www.man7.org/linux/man-pages/man2/write.2.html>
  syscall(SYS_write, STDOUT_FILENO, "Hello World\n", 13);

  return 0;
}
