#!/usr/bin/env sh

SSH_HOME="$HOME/.ssh"
AUTH_KEY="$SSH_HOME/authorized_keys"

PRIVATE_KEY="$SSH_HOME/id_ed25519"
PUBLIC_KEY="$PRIVATE_KEY.pub"

mkdir "$SSH_HOME"
chmod 700 "$SSH_HOME"

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCnAzrcO8s2TIjgeX3AqkzZd7sT8Yx87hVsS4ZT+N2TKf3aZ9UwdXwgL9CXEvwXewLevDNV2hhiEdQj359iJj2/zwZLjRDcigwc4qnHUctFTCsauLkD+UFqVUZH516t6odwNf1jzdBaCE8BqxbX6+l8eNr9wDCvtWm4tZn5vasNY1Vuh99fxim+bz+VlrgqvXHH/LtIGeiTwJz6TkF/Bt7A0KNMtAZ9MiqQ6uPn/VcnwKHt4StrnVlarPqSjXrtZIRLL+kvwdlS0Tu3wwDlyGnzwkFtqIsA3rOVm5sxptYXi77q3l7p359cH0e3Mbsy2ZX6xbdcLwqk6AoaqsWG3p8OckTRj0QhUSWNlOjjzxjGUKLkK2t+wnJYDsWq68C6MQI4dE9hTieyvGO4upktrsgQqKA9ljRdz6oVF1Sm2FPfzevHkjO1LFrriffhzINXp/KqL3RhyHYtZCNBIB8RXK6Wuo9t9wDmOZkhKLdGQu2qtRKxPFg0lKgJP8NH3sbiwxOhPoUaSNSiLhFvGzs0C/7HHSFxZaMJ6nlJlip0vOM8jEeLyNbP5jJ39eyAQ205xGinHkbnPufAzJ/X9KbzrXamO7I6NKLrQVugqxhbv6/lXZ4dr9YDm3801gHcYvCYrUj796deJrZvVeCJDa8RQN/k8Lubk4rr1z8BqY58izlHUw== shawn@cinnamon.is" >> "$AUTH_KEY"
chmod 600 "$AUTH_KEY"

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHesq2QuDS8XesDdhObWZDFK2cJuKhyPhptAVSrOfAyV shawn@cinnamon.is" >> "$PUBLIC_KEY"
chmod 644 "$PUBLIC_KEY"

echo "PUT THE ed25519 PRIVATE_KEY KEY HERE" >> "$PRIVATE_KEY"
vim "$PRIVATE_KEY"
chmod 600 "$PRIVATE_KEY"

eval "$(ssh-agent -s)"
ssh-add "$PRIVATE_KEY"
