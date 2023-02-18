import React from "react";
import { useColorScheme, Text } from "react-native";
import {
  TamaguiProvider,
  config,
  MyComponent,
  Button,
  Input,
} from "@so-join/ui";

import { useFonts } from "expo-font";

import { TRPCProvider } from "./utils/api";

export const App = () => {
  const scheme = useColorScheme();

  const [loaded] = useFonts({
    Inter: require("@tamagui/font-inter/otf/Inter-Medium.otf"),
    InterBold: require("@tamagui/font-inter/otf/Inter-Bold.otf"),
  });

  if (!loaded) {
    return null;
  }

  return (
    <TRPCProvider>
      <TamaguiProvider
        config={config}
        disableInjectCSS
        defaultTheme={scheme === "dark" ? "dark" : "light"}
      >
        <MyComponent>
          <Text>123</Text>
          <Text>123</Text>
          <Text>123</Text>
          <Button>14423</Button>
          <Input />
          <Button>666</Button>
          <Button>1334423</Button>
        </MyComponent>
      </TamaguiProvider>
    </TRPCProvider>
  );
};
