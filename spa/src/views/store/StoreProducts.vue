<template>
  <div>
    <search-input></search-input>
    <div class="w-full h-fit overflow-auto scrollbar">
      <store-groups-list></store-groups-list>
    </div>
  </div>
</template>
<script>
import SearchInput from "@/components/shared/SearchInput.vue";
import StoreGroupsList from "@/components/store/StoreGroupsList.vue";
export default {
  components: {
    SearchInput,
    StoreGroupsList,
  },
  setup() {},
};
</script>
