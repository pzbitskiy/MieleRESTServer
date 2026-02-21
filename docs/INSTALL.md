# Linux Installation (systemd)

This project is installed as a Python package in a virtual environment, then
run as a `systemd` service.

## 1) Prepare host

Install Python 3 and `venv` support from your distribution packages, then:

```bash
sudo useradd --system --home /opt/mielerestserver --shell /usr/sbin/nologin mieleserver || true
sudo mkdir -p /opt/mielerestserver
sudo chown "$USER":"$USER" /opt/mielerestserver
```

## 2) Checkout and install

```bash
git clone https://github.com/akappner/MieleRESTServer.git /opt/mielerestserver
cd /opt/mielerestserver
python3 -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install .
```

## 3) Configure

Copy and edit the example config:

```bash
sudo install -m 0644 examples/MieleRESTServer-example-config.yaml /etc/MieleRESTServer.config
sudo editor /etc/MieleRESTServer.config
```

Optional runtime overrides can be placed in `/etc/default/mielerestserver`:

```bash
sudo install -m 0644 examples/mielerestserver.env /etc/default/mielerestserver
sudo editor /etc/default/mielerestserver
```

## 4) Install service

```bash
sudo install -m 0644 MieleRESTServer.service /etc/systemd/system/MieleRESTServer.service
sudo systemctl daemon-reload
sudo systemctl enable --now MieleRESTServer
sudo systemctl status MieleRESTServer
```

## Upgrade

```bash
cd /opt/mielerestserver
git pull --ff-only
.venv/bin/pip install --upgrade .
sudo systemctl restart MieleRESTServer
```

## Uninstall

```bash
sudo systemctl disable --now MieleRESTServer
sudo rm -f /etc/systemd/system/MieleRESTServer.service
sudo systemctl daemon-reload
sudo rm -rf /opt/mielerestserver
sudo rm -f /etc/default/mielerestserver /etc/MieleRESTServer.config
```
