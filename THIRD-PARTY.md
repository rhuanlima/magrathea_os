# Software de terceiros

A ISO do Magrathea OS é uma derivação do **Debian GNU/Linux**. Cada pacote
mantém a sua licença própria, e o arquivo `copyright` de cada um é preservado
em `/usr/share/doc/<pacote>/copyright` dentro da imagem.

## Componentes principais

| Componente | Licença | Observação |
|---|---|---|
| Debian GNU/Linux | várias (principalmente GPL, LGPL, MIT, BSD) | base do sistema |
| Kernel Linux | GPL-2.0 | |
| cage | MIT | compositor Wayland de um app |
| WebKitGTK, GTK | LGPL-2.1+ | usados pelo Tauri |
| Magrathea Writer | AGPL-3.0-or-later | baixado da release indicada em `app-version.txt` |

## Firmware e drivers não livres

Para funcionar em notebooks antigos, a imagem inclui pacotes da seção
`non-free-firmware` e `non-free` do Debian:

- `firmware-misc-nonfree`, `firmware-iwlwifi`, `firmware-realtek`,
  `firmware-atheros`, `firmware-brcm80211`
- `broadcom-sta-dkms` (driver Wi-Fi proprietário da Broadcom)

Esses pacotes **não** são cobertos pela AGPL deste repositório e têm
licenças de redistribuição próprias (ver o `copyright` de cada um).

## Código-fonte

O código-fonte correspondente aos pacotes Debian está disponível em
<https://deb.debian.org/debian/> (seção `source`). O código do Magrathea Writer
está em <https://github.com/rhuanlima/magrathea-writer>. Este repositório
contém a configuração usada para gerar a ISO.
