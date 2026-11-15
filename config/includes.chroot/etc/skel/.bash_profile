# Inicia a sessão de escrita automaticamente no primeiro terminal (tty1).
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec /usr/local/bin/magrathea-session
fi
