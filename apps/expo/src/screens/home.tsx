import React from "react";
import { Button, Text, TextInput, TouchableOpacity, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { FlashList } from "@shopify/flash-list";
import { api, type RouterOutputs } from "../utils/api";

const PostCard: React.FC<{
  post: RouterOutputs["post"]["all"][number];
  onPress: () => void;
  onDelete: () => void;
}> = ({ post, onPress, onDelete }) => {
  return (
    <View>
      <View>
        <TouchableOpacity onPress={onPress}>
          <Text>{post.title || "Untitled"}</Text>
          <Text>{post.content || "No content"}</Text>
        </TouchableOpacity>
      </View>
      <TouchableOpacity onPress={onDelete}>
        <Text>Delete</Text>
      </TouchableOpacity>
    </View>
  );
};

const CreatePost: React.FC = () => {
  const utils = api.useContext();

  const [title, setTitle] = React.useState("");
  const [content, setContent] = React.useState("");

  const { mutate } = api.post.create.useMutation({
    async onSuccess() {
      setTitle("");
      setContent("");
      await utils.post.all.invalidate();
    },
  });

  return (
    <View>
      <TextInput
        placeholderTextColor="rgba(255, 255, 255, 0.5)"
        value={title}
        onChangeText={setTitle}
        placeholder="Title"
      />
      <TextInput
        placeholderTextColor="rgba(255, 255, 255, 0.5)"
        value={content}
        onChangeText={setContent}
        placeholder="Content"
      />
      <TouchableOpacity
        onPress={() => {
          mutate({
            title,
            content,
          });
        }}
      >
        <Text>Publish post</Text>
      </TouchableOpacity>
    </View>
  );
};

export const HomeScreen = () => {
  const postQuery = api.post.all.useQuery();
  const [showPost, setShowPost] = React.useState<string | null>(null);

  const deletePostMutation = api.post.delete.useMutation({
    onSettled: () => postQuery.refetch(),
  });

  return (
    <SafeAreaView>
      <View>
        <Text>
          Create <Text>T3</Text> Turbo
        </Text>

        <Button
          onPress={() => void postQuery.refetch()}
          title="Refresh posts"
          color={"#cc66ff"}
        />

        <View>
          {showPost ? (
            <Text>
              <Text>Selected post: </Text>
              {showPost}
            </Text>
          ) : (
            <Text>Press on a post</Text>
          )}
        </View>

        <FlashList
          data={postQuery.data}
          estimatedItemSize={20}
          ItemSeparatorComponent={() => <View />}
          renderItem={(p) => (
            <PostCard
              post={p.item}
              onPress={() => setShowPost(p.item.id)}
              onDelete={() => deletePostMutation.mutate(p.item.id)}
            />
          )}
        />

        <CreatePost />
      </View>
    </SafeAreaView>
  );
};
