import { styled, SizableText } from "tamagui";

export const Typography = styled(SizableText, {
  name: "Typography",
  userSelect: "auto",
  color: "$whiteAlpha900",

  variants: {
    variant: {
      h1: {
        fontSize: 32,
        fontWeight: "500",
        lineHeight: 46,
        letterSpacing: 1,
      },
      title: {
        fontSize: 18,
        fontWeight: "500",
        lineHeight: 26,
        letterSpacing: 1,
      },
      p18: {
        fontSize: 18,
        fontWeight: "400",
        lineHeight: 26,
        letterSpacing: 1,
      },
      p16: {
        fontSize: 16,
        fontWeight: "400",
        lineHeight: 23,
        letterSpacing: 1,
      },
      p14: {
        fontSize: 14,
        fontWeight: "400",
        lineHeight: 21,
        letterSpacing: 1,
      },
      p12: {
        fontSize: 12,
        fontWeight: "400",
        lineHeight: 17,
        letterSpacing: 1,
      },
    },
  } as const,
});
