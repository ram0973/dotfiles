cat <<-'EOF' | sudo tee -a /etc/sudoers.d/sudo
%sudo         ALL = (ALL) NOPASSWD: ALL
EOF

