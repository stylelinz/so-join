import { styled, YStack } from "tamagui";

export const MyComponent = styled(YStack, {
  name: "MyComponent",
  bc: "salmon",
  padding: 20,
  variants: {
    blue: {
      true: {
        backgroundColor: "blue",
      },
    },
  } as const,
});
