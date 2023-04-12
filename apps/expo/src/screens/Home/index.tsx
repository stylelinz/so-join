import { SafeAreaView } from "react-native-safe-area-context";
import { Settings } from "@tamagui/lucide-icons";
import { MyComponent, Stack, YStack, Typography, tokens } from "@so-join/ui";
import { EventCard } from "components";

export function Home() {
  return (
    <MyComponent>
      <SafeAreaView style={{ flex: 1 }}>
        <Stack flex={1}>
          {/* HEADER */}
          <Stack paddingVertical={12} paddingHorizontal={24}>
            <Stack flexDirection="row" alignItems="center">
              <Typography variant="h1" flex="1">
                總覽
              </Typography>
              <Settings
                color={tokens.color.whiteAlpha900 as unknown as string}
              />
            </Stack>
            <Typography variant="title">活動時間規劃</Typography>
          </Stack>
          <YStack paddingVertical={12} paddingHorizontal={24} space="$3">
            <EventCard />
            <EventCard />
            {/* <EventCard /> */}
          </YStack>
        </Stack>
      </SafeAreaView>
    </MyComponent>
  );
}
