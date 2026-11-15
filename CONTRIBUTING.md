# Contribuindo com o Magrathea OS

Obrigado pelo interesse! O Magrathea OS é licenciado sob a
**GNU Affero General Public License v3 (AGPLv3)**.

## Princípios

1. **Leveza primeiro.** Todo pacote novo precisa justificar o peso que traz.
   Nada de ambiente de desktop, serviço em segundo plano ou programa que não
   ajude a escrever.
2. **Sem distração, sem rede por padrão.** A sessão padrão não tem navegador
   nem telemetria, e nada se conecta à internet por conta própria.
3. **Reprodutível.** A versão do app fica fixa em `app-version.txt`.
4. **Developer Certificate of Origin (DCO).** Todo commit precisa do trailer
   `Signed-off-by: Nome <email>` (use `git commit -s`).

## Fluxo

1. Crie uma branch a partir de `main`.
2. Um commit por mudança, com mensagem no formato `tipo(escopo): resumo`
   (`feat`, `fix`, `docs`, `chore`, `ci`).
3. Abra um PR descrevendo o que mudou e **como foi testado** (VM, hardware real).

## Testes

Mudanças na configuração devem ser testadas ao menos em uma VM
(`qemu-system-x86_64 -m 2048 -enable-kvm -cdrom live-image-amd64.hybrid.iso`).
Informe no PR o modelo de hardware, quando testar em máquina real.
