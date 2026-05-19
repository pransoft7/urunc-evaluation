#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main() {
    int srv = socket(AF_INET, SOCK_STREAM, 0);
    int opt = 1;
    setsockopt(srv, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));

    struct sockaddr_in addr = {
        .sin_family      = AF_INET,
        .sin_port        = htons(8080),
        .sin_addr.s_addr = INADDR_ANY
    };
    bind(srv, (struct sockaddr *)&addr, sizeof(addr));
    listen(srv, SOMAXCONN);

    printf("Echo server listening on :8080\n");
    fflush(stdout);

    while (1) {
        int client = accept(srv, NULL, NULL);
        char buf[256];
        int n;
        while ((n = read(client, buf, sizeof(buf))) > 0)
            write(client, buf, n);
        close(client);
    }
}