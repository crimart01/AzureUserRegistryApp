# Sistema de Registro de Usuarios con Azure y Supabase

## Solución al problema de variables de entorno

He corregido el error de inicialización de Supabase. El problema era que `process.env` no existe en el navegador. Las soluciones implementadas son:

### Archivos creados/modificados:

1. **index.html** - Modificado para usar `window.SUPABASE_URL` en lugar de `process.env`
2. **config.js** - Nuevo archivo que define las variables de configuración
3. **staticwebapp.config.json** - Configuración para Azure Static Web Apps
4. **azure-deploy.yml** - Pipeline de CI/CD para Azure con reemplazo de variables

### Cómo usar las variables de entorno en Azure:

#### Opción 1: Usar el archivo config.js directamente (Desarrollo)
- Las credenciales están en `config.js`
- Funciona inmediatamente al abrir `index.html`

#### Opción 2: Variables de entorno en Azure (Producción)
1. En Azure Portal, ve a tu Static Web App
2. Ve a Configuration > Application settings
3. Agrega estas variables:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`

4. En tu repositorio de GitHub, agrega estos secrets:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `AZURE_STATIC_WEB_APPS_API_TOKEN`

5. Modifica `config.js` para usar placeholders:
```javascript
window.SUPABASE_URL = '__SUPABASE_URL__';
window.SUPABASE_ANON_KEY = '__SUPABASE_ANON_KEY__';
```

6. El pipeline de Azure reemplazará estos valores durante el deployment

### Verificación:
1. Abre `index.html` en tu navegador
2. La aplicación debería conectarse correctamente a Supabase
3. Prueba creando un registro y visualizando el gráfico

El error está completamente resuelto y la aplicación ahora maneja las variables de configuración de forma flexible.