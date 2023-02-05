module.exports = function (api) {
  api.cache(true);
  return {
    plugins: [
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
