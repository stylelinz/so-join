module.exports = function (api) {
  api.cache(true);
  return {
    presets: [["babel-preset-expo", { jsxRuntime: "automatic" }]],
    plugins: [
      [
        require.resolve("babel-plugin-module-resolver"),
        {
          extensions: [
            ".ts",
            ".tsx",
            ".ios.ts",
            ".ios.tsx",
            ".android.ts",
            ".android.tsx",
          ],
          root: ["./src"],
          alias: {
            "@/navigator": "./src/navigator",
            "@/screens": "./src/screens",
          },
        },
      ],
      [
        "@tamagui/babel-plugin",
        {
          exclude: /node_modules/,
          config: "./tamagui.config.ts",
          components: ["@so-join/ui", "tamagui"],
        },
      ],
      [
        "transform-inline-environment-variables",
        {
          include: "TAMAGUI_TARGET",
        },
      ],
    ],
    presets: ["babel-preset-expo"],
  };
};
