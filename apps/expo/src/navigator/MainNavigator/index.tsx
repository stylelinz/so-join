import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { BarChart2, Plus, List } from "@tamagui/lucide-icons";
import { Stack, tokens } from "@so-join/ui";

import { Home } from "../../screens";

const Tab = createBottomTabNavigator();

export function MainNavigator() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown: false,
        tabBarStyle: { position: "absolute", borderTopWidth: 0 },
        tabBarInactiveTintColor: "rgba(255,255,255,0.5)",
        tabBarActiveTintColor: "rgba(255,255,255,1)",
        tabBarIcon: ({ color, focused }) => {
          switch (route.name) {
            case "Home": {
              return <BarChart2 color={color} />;
            }
            case "Create": {
              return <Plus color={color} />;
            }
            case "Record": {
              return <List color={color} />;
            }
            default: {
              return (
                <List color={tokens.color.whiteAlpha900 as unknown as string} />
              );
            }
          }
        },
        tabBarBackground: () => <Stack backgroundColor="#1f2629" flex={1} />,
      })}
    >
      <Tab.Screen name="Home" component={Home} />
      <Tab.Screen name="Create" component={Home} />
      <Tab.Screen name="Record" component={Home} />
    </Tab.Navigator>
  );
}
