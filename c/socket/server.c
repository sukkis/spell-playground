#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <unistd.h>


int main(int argc, char *argv[])
{

	int sockfd, newsockfd, portno, n;
	socklen_t clilen;

	// Server reads characters from socket to this.
	char buffer[256];

	struct sockaddr_in serv_addr, cli_addr;

	if (argc < 2)
	{
		fprintf(stderr,"ERROR, no port provided");
		exit(1);
	}


/* Socket. AF_INET for IP4, SOCK_STREAM for TCP,
0 for automatically choosing - TCP for streams and UDP for datagrams.
 */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0){
		perror("ERROR opening socket");
	}

	// Initialize serv_addr with zeroes.
	bzero((char *) &serv_addr, sizeof(serv_addr));

	// Port number.
	portno = atoi(argv[1]);

	// Use IP v4 (as opposed to local)
	serv_addr.sin_family = AF_INET;

	// Assign the port number, in Network Byte Order.
	serv_addr.sin_port = htons(portno);

	// Server address is automatically.
	serv_addr.sin_addr.s_addr = INADDR_ANY;

	// BIND.
	if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0){
		perror("ERROR on binding");
	}

	// LISTEN.
	// Backlog queue a max of 6 clients waiting to connect.
	listen(sockfd,5);

	// ACCEPT.
	clilen = sizeof(cli_addr);
	newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
	if (newsockfd < 0){
		perror("ERROR on accept");
	}

	// READ.
	bzero(buffer,256);
	n = read(newsockfd,buffer,255);
	if (n < 0){
		perror("ERROR reading from socket");
	}
	printf("Here is the message: %s",buffer);

	// Write
	n = write(newsockfd,"I got your message",18);
	if (n < 0){
		perror("ERROR writing to socket");
	}
	return 0;
}
