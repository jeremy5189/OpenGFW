# ![OpenGFW](docs/logo.png)

## What is different in this fork?

### Running in docker

```bash
docker-compose up
```

### Use the socks5 proxy server to test

- Address: 127.0.0.1:1080
- Type: Socks5
- Username/Password is not required

### Testing with curl

```bash
docker exec -it OpenGFW curl -k https://farmal.in
> Error response from daemon: Container 3f0f87bca0ee80b31d96766f68c59e071f4211e4950d6ac71be6533533326051 is not running
docker exec -it OpenGFW curl -k https://farmal.in
> curl: (7) Failed to connect to farmal.in port 443 after 390 ms: Couldnot connect to server
docker exec -it OpenGFW ping farmal.in
> PING farmal.in (0.0.0.0): 56 data bytes
> 64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.366 ms
> 64 bytes from 127.0.0.1: seq=1 ttl=64 time=2.010 ms
```

OpenGFW outputs:

```
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482821349343232, "src": "172.22.0.2:39732", "dst": "192.168.65.7:53", "action": "modify"}
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482821345148928, "src": "127.0.0.1:39912", "dst": "127.0.0.11:35187", "action": "modify"}
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482822137872384, "src": "127.0.0.11:53", "dst": "127.0.0.1:39912", "action": "modify"}
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482821349347328, "src": "172.22.0.2:55588", "dst": "192.168.65.7:53", "action": "modify"}
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482822968344576, "src": "127.0.0.11:35187", "dst": "127.0.0.1:39912", "action": "modify"}
OpenGFW  | 2024-07-11T19:28:55Z	INFO	UDP stream action	{"id": 1811482822968344577, "src": "127.0.0.11:53", "dst": "127.0.0.1:39912", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859186159616, "src": "172.22.0.2:33093", "dst": "192.168.65.7:53", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859177783296, "src": "127.0.0.1:57126", "dst": "127.0.0.11:35187", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859198754816, "src": "127.0.0.11:53", "dst": "127.0.0.1:57126", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859186163712, "src": "172.22.0.2:53652", "dst": "192.168.65.7:53", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859202949120, "src": "127.0.0.11:35187", "dst": "127.0.0.1:57126", "action": "modify"}
OpenGFW  | 2024-07-11T19:29:04Z	INFO	UDP stream action	{"id": 1811482859202949121, "src": "127.0.0.11:53", "dst": "127.0.0.1:57126", "action": "modify"}
```

---

[![Quality check status](https://github.com/apernet/OpenGFW/actions/workflows/check.yaml/badge.svg)](https://github.com/apernet/OpenGFW/actions/workflows/check.yaml)
[![License][1]][2]

[1]: https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg
[2]: LICENSE

**[中文文档](README.zh.md)**
**[日本語ドキュメント](README.ja.md)**

OpenGFW is your very own DIY Great Firewall of China (https://en.wikipedia.org/wiki/Great_Firewall), available as a flexible, easy-to-use open source program on Linux. Why let the powers that be have all the fun? It's time to give power to the people and democratize censorship. Bring the thrill of cyber-sovereignty right into your home router and start filtering like a pro - you too can play Big Brother.

**Documentation site: https://gfw.dev/**

Telegram group: https://t.me/OpGFW

> [!CAUTION]
> This project is still in very early stages of development. Use at your own risk. We are looking for contributors to help us improve and expand the project.

## Features

- Full IP/TCP reassembly, various protocol analyzers
  - HTTP, TLS, QUIC, DNS, SSH, SOCKS4/5, WireGuard, OpenVPN, and many more to come
  - "Fully encrypted traffic" detection for Shadowsocks, VMess,
    etc. (https://gfw.report/publications/usenixsecurity23/en/)
  - Trojan (proxy protocol) detection
  - [WIP] Machine learning based traffic classification
- Full IPv4 and IPv6 support
- Flow-based multicore load balancing
- Connection offloading
- Powerful rule engine based on [expr](https://github.com/expr-lang/expr)
- Hot-reloadable rules (send `SIGHUP` to reload)
- Flexible analyzer & modifier framework
- Extensible IO implementation (only NFQueue for now)
- [WIP] Web UI

## Use cases

- Ad blocking
- Parental control
- Malware protection
- Abuse prevention for VPN/proxy services
- Traffic analysis (log only mode)
- Help you fulfill your dictatorial ambitions
