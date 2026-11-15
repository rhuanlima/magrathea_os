# Magrathea OS

Um sistema Linux mínimo, feito para uma coisa só: **escrever sem distração** no
[Magrathea Writer](https://github.com/rhuanlima/magrathea-writer).

Liga, abre o editor em tela cheia, e é isso. Sem desktop, sem notificações,
sem barra de tarefas. Pensado para dar nova vida a notebooks antigos
(por exemplo, um MacBook Air 2012) ou para ter uma máquina só de escrita.

> **Estado:** protótipo inicial. A configuração ainda **não foi construída nem
> testada em hardware**. Veja o [roteiro](#roteiro).

## Como funciona

- **Base:** Debian estável (amd64), gerado com `live-build`. Debian foi escolhido
  por já termos um `.deb` do app (glibc + WebKitGTK) e por receber atualizações
  de segurança sem que este projeto precise mantê-las.
- **Sessão:** o `cage` (compositor Wayland de um só app) abre o Magrathea Writer
  em tela cheia direto do terminal. Não há gerenciador de login nem ambiente de
  desktop. Ao fechar o app, aparece um menu em texto (voltar, reiniciar, desligar).
- **App:** o `.deb` da release do Magrathea Writer indicada em
  [`app-version.txt`](app-version.txt) é baixado e embarcado na ISO. A versão é
  fixa de propósito: cada ISO é reproduzível e uma beta quebrada do app não
  entra sozinha na imagem.
- **Leveza:** sem `recommends`, sem documentação nem manuais, locales só `pt` e
  `en`, `zram` em vez de swap em disco, `tlp` para bateria. Firmware pesa na ISO,
  mas só é carregado se o hardware precisar.
- **Importar arquivos (imagens, mapas):** pendrive ou cartão SD, montados
  pelo `udisks2`. Não há navegador no sistema padrão.

## Gerar a ISO

Precisa de Debian ou Ubuntu, `gh` autenticado e root:

```bash
sudo apt install live-build debootstrap debian-archive-keyring gh
sudo ./scripts/build.sh
```

Saem `live-image-amd64.hybrid.iso` e o `.sha256`. Para gravar em um pendrive:
`sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdX bs=4M status=progress`
(confira o `sdX`, `dd` apaga o destino sem perguntar).

O workflow [`build-iso.yml`](.github/workflows/build-iso.yml) faz o mesmo no
GitHub Actions, manualmente ou ao criar uma tag `os-*`.

## Atualizar a versão do app

Edite `app-version.txt` (por exemplo, `v0.9.6-beta.6`) e abra um PR.

## Roteiro

- [ ] Construir a ISO e iniciá-la em uma VM (QEMU)
- [ ] Testar em hardware real (MacBook Air 2012: Wi-Fi Broadcom, teclado, bateria)
- [ ] Medir consumo de RAM ocioso e tamanho da ISO
- [ ] Modo persistente em pendrive/cartão SD (partição de dados separada, cifrada)
- [ ] Instalador para o disco (Calamares)
- [ ] "Modo pesquisa" opcional, com navegador leve e rede (sessão separada)
- [ ] Avaliar base ainda mais leve (Alpine/musl exigiria compilar o app para musl)

## Licença

[GNU AGPL v3](LICENSE), a mesma do Magrathea Writer. A ISO inclui software de
terceiros com licenças próprias, incluindo firmware não livre; veja
[`THIRD-PARTY.md`](THIRD-PARTY.md).
