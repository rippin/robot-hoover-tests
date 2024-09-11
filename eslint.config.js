import globals from 'globals';
import pluginJs from '@eslint/js';

export default [
  { files: ['**/*.{js,mjs,cjs,ts}'] },
  { languageOptions: { globals: { ...globals.browser, ...globals.node } } },
  { ignores: ['playwright-report/'] },
  pluginJs.configs.recommended,
];
