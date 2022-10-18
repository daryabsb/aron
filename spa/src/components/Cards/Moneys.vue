<template>
  <Grid
    rows="4"
    cols="4"
    gap="2"
    class="h-full w-full sm:my-4 p-3 pt-8 sm:rounded-sm bg-inherit border border-aronium-500"
  >
    <Button
      v-for="money in moneys"
      :key="money"
      class="col-span-2"
      variant="transparent"
      @click="addCash(money)"
      >{{ money }}</Button
    >
  </Grid>
</template>
<script>
import Button from "@/components/shared/Button.vue";
import Grid from "@/components/shared/Grid.vue";
import { usePos } from "@/stores/pos";
export default {
  name: "Moneys",
  components: { Button, Grid },
  setup() {
    const store = usePos();
    const moneys = store.useMoneys;
    const addCash = store.addCash;

    return {
      moneys,
      addCash,
    };
  },
};
</script>
