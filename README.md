# Tiko · frontend

SPA de Tiko con **Angular 21 LTS** (standalone, signals, SCSS), **Tailwind CSS 4** y **Vitest**.

## Requisitos

- Node.js 24
- npm 11+

Con Nix:

```bash
nix develop
```

## Arrancar

```bash
npm install
npm start
```

La app queda en <http://localhost:4200>. El dev server proxya `/api` hacia el
backend Spring Boot en <http://localhost:8080> (`proxy.conf.json`).

## Build y tests

```bash
npm run build
npm test
```

## Tailwind CSS

Tailwind 4 se procesa con `@tailwindcss/postcss` a través de `.postcssrc.json`;
el builder de Angular lo detecta automáticamente. La directiva de entrada está
en `src/styles.css`:

```scss
@import 'tailwindcss';
```

## Estructura

```
src/app/
├── app.ts              # componente raíz
├── app.html
├── app.scss
├── app.config.ts       # HttpClient + router
└── app.routes.ts
```
