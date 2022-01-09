import idna
from socket import socket
from OpenSSL import SSL
import OpenSSL
import re
from urllib import parse

def get_certificate_san(x509cert):
    if x509cert == '':
        return set()
    san = ''
    ext_count = x509cert.get_extension_count()
    for i in range(0, ext_count):
        ext = x509cert.get_extension(i)
        if 'subjectAltName' in str(ext.get_short_name()):
            san = set(filter(None, re.split(',| |:|DNS', ext.__str__())))
    return san

def get_certificate(hostname, port):
    sock = socket()
    sock.setblocking(1)

    print(hostname)
    print(port)
    sock.settimeout(10)
    try:
        sock.connect((hostname, port), )
    except BaseException:
        return ''
    ctx = SSL.Context(SSL.SSLv23_METHOD)
    ctx.check_hostname = False
    ctx.verify_mode = SSL.VERIFY_NONE

    sock_ssl = SSL.Connection(ctx, sock)
    sock_ssl.set_tlsext_host_name(idna.encode(hostname))
    sock_ssl.set_connect_state()
    for i in range(20):
        try:
            sock_ssl.do_handshake()
        except OpenSSL.SSL.WantReadError:
            print("SSL ERROR")
        else:
            break
    cert = sock_ssl.get_peer_certificate()
    sock_ssl.close()
    sock.close()
    return cert

# 主入口
def get_from_cert_all_in_one(fraud_input_domain):
    # fraud_input_domain = ['https://m.cr173.com/', 'https://www.binancezh.com', 'https://qc66888.com']
    # for u in fraud_input_domain:
    rs = parse.urlparse(fraud_input_domain)
    cert = get_certificate(rs.netloc or rs.path, int(rs.port or 443))
    # print(get_certificate_san(cert))
    # print(cert.get_subject().CN)
    san = list(get_certificate_san(cert))
    if len(san) > 20:
        san = san[0:20]
    return set(san)