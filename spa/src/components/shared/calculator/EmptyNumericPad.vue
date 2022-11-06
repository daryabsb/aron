<template>
  <Grid
    rows="4"
    cols="4"
    gap="2"
    class="h-full text-aronium-white sm:my-4 mt-3 p-3 pt-3 sm:rounded-sm bg-inherit border border-aronium-500"
  >
    <!-- class="shadow-2xl w-full sm:max-w-md sm:h-auto sm:my-3 p-3 pt-12 sm:rounded-sm bg-inherit border border-aronium-500" -->
    <!-- <Screen :text="memory" :error="error" class="col-span-6" /> -->

    <!-- <Button variant="transRed" class="col-span-2" @click="clear">Clear</Button> -->

    <Button
      v-for="number in ['1', '2', '3']"
      :key="number"
      variant="transparent"
    >
    </Button>
    <Button variant="transYellow"></Button>

    <Button
      v-for="number in ['4', '5', '6']"
      :key="number"
      variant="transparent"
    >
    </Button>
    <Button variant="transRed"></Button>

    <Button
      v-for="number in ['7', '8', '9']"
      :key="number"
      variant="transparent"
    >
    </Button>
    <Button
      variant="transparent"
      class="row-start-3 col-start-4 inset-0 col-span-1 row-span-2"
    ></Button>
    <Button variant="transparent" class="col-span-2"></Button>
    <Button variant="transparent"></Button>
  </Grid>
</template>

<script setup>
import Modal from "@/components/shared/Modal.vue";

import Button from "@/components/shared/Button.vue";
import Screen from "./Screen.vue";
import Grid from "@/components/shared/Grid.vue";
</script>
