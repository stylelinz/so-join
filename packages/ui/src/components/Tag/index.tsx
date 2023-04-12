import { styled, Stack } from "tamagui";
import { Typography } from "../Typography";

export const Container = styled(Stack, {
  name: "Tag",
  // color: "white",
  minWidth: 66,
  height: 28,

  paddingHorizontal: 12,
  paddingVertical: 4,

  backgroundColor: "$gray700",
  borderRadius: 5,

  alignItems: "center",
  justifyContent: "center",
  // bc: "$color",
  // bc: "true",
  // flex: 1,
});

type Props = {
  children: string;
};

export function Tag({ children, ...props }: Props) {
  return (
    <Container {...props}>
      <Typography fontSize={14} lineHeight={20}>
        {children}
      </Typography>
    </Container>
  );
}
