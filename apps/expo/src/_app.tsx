import { StatusBar } from "expo-status-bar";
import React from "react";
import { useColorScheme, Text } from "react-native";

import { SafeAreaProvider } from "react-native-safe-area-context";
import { TRPCProvider } from "./utils/api";

import { TamaguiProvider, config, MyComponent } from "@so-join/ui";

import { HomeScreen } from "./screens/home";

export const App = () => {
  const scheme = useColorScheme();
  console.log(process.env);
  return (
    <TRPCProvider>
      <TamaguiProvider
        config={config}
        disableInjectCSS
        defaultTheme={scheme === "dark" ? "dark" : "light"}
      >
        <MyComponent>
          <Text>123</Text>
        </MyComponent>
      </TamaguiProvider>
    </TRPCProvider>
  );
};
