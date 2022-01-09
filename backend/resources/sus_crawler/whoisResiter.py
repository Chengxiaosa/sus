# !/usr/bin/env python3
import whois
domain = whois.whois('sohu.com')
print(domain['registrar'])