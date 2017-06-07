#include <unistd.h>
#include <sys/syscall.h>
#include <errno.h>
#include <stdio.h>

int main() {

    int call = syscall(SYS_chmod, "/home/jep/testfile", 0755);

    if (call == -1) {
        fprintf(stderr, "chmod failed, errno = %d\n", errno);
    }
   
    return 0;
}
