import React from "react";
import { StatusBar, useColorScheme } from "react-native";
import { TamaguiProvider, config } from "@so-join/ui";
import { NavigationContainer } from "@react-navigation/native";
import { SafeAreaProvider } from "react-native-safe-area-context";
import { useFonts } from "expo-font";

import { TRPCProvider } from "./utils/api";

import { MainNavigator } from "./navigator";

export const App = () => {
  const scheme = useColorScheme();

  const [loaded] = useFonts({
    // TODO: switch font family
    Inter: require("@tamagui/font-inter/otf/Inter-Medium.otf"),
    InterMedium: require("@tamagui/font-inter/otf/Inter-Medium.otf"),
    InterSemiBold: require("@tamagui/font-inter/otf/Inter-SemiBold.otf"),
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
        <SafeAreaProvider>
          <NavigationContainer>
            <StatusBar barStyle="light-content" />
            <MainNavigator />
          </NavigationContainer>
        </SafeAreaProvider>
      </TamaguiProvider>
    </TRPCProvider>
  );
};
