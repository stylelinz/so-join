import { MoreHorizontal } from "@tamagui/lucide-icons";
import { Stack, Typography, Tag, styled, XStack } from "@so-join/ui";

const CardContainer = styled(Stack, {
  name: "CardContainer",
  backgroundColor: "#1F2629",
  // width: 342,
  height: 204,
  borderRadius: 16,

  paddingVertical: 12,
  paddingHorizontal: 16,

  alignItems: "flex-start",
  justifyContent: "space-between",

  position: "relative",
});

export function EventCard() {
  return (
    <CardContainer>
      <Stack position="absolute" top={20} right={16}>
        <MoreHorizontal color="white" width={16} height={16} />
      </Stack>
      <Typography fontSize={24} lineHeight={35}>
        JOJO展
      </Typography>
      <Typography fontSize={12} lineHeight={17} fontWeight="700">
        上午 12:00 - 下午 7:00
      </Typography>
      <Stack>
        <Typography variant="p18">3月</Typography>
        <Typography variant="p18">20、22、23</Typography>
      </Stack>
      <XStack space={8}>
        <Tag backgroundColor="$blue500">統計中</Tag>
        <Tag>1人填寫</Tag>
        <Typography variant="p16" flex="1" textAlign="right">
          查看統計
        </Typography>
      </XStack>
    </CardContainer>
  );
}
