# =======================
# === COMANDOS DE GIT ===
# =======================

# Añadir todos los cambios al staging
add:
    @git add .

# Hacer commit con un mensaje
commit msg:
    @git commit -m "{{msg}}"

# Subir los cambios a la rama main
push:
    @git push origin main

# Flujo completo: add, commit y push
save msg:
    @just add
    @just commit "{{msg}}"
    @just push
