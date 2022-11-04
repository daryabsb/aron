<template>
  <div class="h-full py-12 items-start text-aronium-white bg-aronium-900">
    <div class="flex flex-col">
      <div class="flex flex-col">
        <label class="text-zinc-100 uppercase text-sm" for="group-name"
          >Group Name</label
        >
        <input
          id="group-name"
          v-model="groupName"
          class="my-3 px-3 text-zinc-900"
          type="text"
          name="group-name"
        />
      </div>
    </div>
    <div class="flex flex-col my-6">
      <label class="text-zinc-100 uppercase text-sm" for="group-parent">
        Parent Name
      </label>

      <select
        id="group-parent"
        v-model="parentId"
        class="my-3 pr-24 text-zinc-900"
        @change="onChange($event)"
      >
        <option
          v-for="group in useGetProductGroups"
          :key="group.id"
          :value="group.id"
          >{{ group.name }}</option
        >
      </select>
    </div>
    <div class="flex justify-even w-full">
      <div class="mx-6">
        <button @click="addNewGroup">Add Group</button>
      </div>
      <div class="mx-6">
        <button>Cancel</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import useGetProductGroups from "@/composables/useGetProductGroups";
import Modal from "@/components/shared/Modal.vue";

// import ModalSmall from "@/components/shared/ModalSmall.vue";
import { addNewProductGroup } from "@/store/composables";

export default {
  components: {
    Modal,
    // ModalSmall,
  },
  props: {},
  setup(props, { emit }) {
    const groupName = ref("");
    const parentId = ref(0);
    const groupMaps = ref([]);
    const groupNames = Object.entries(useGetProductGroups.value).forEach(
      (group) => {
        // let el = {};
        // el.id = group[0];
        // el.name = group[1];

        groupMaps.value.push(group[1]);
      }
    );
    const onChange = (e) => console.log(e.target.value);

    const addNewGroup = () => {
      const data = {
        name: groupName.value,
        parent_group: parentId.value,
      };
      addNewProductGroup(data);
      emit("close");
    };

    return {
      parentId,
      groupName,
      groupNames,
      addNewGroup,
      onChange,
      useGetProductGroups,
    };
  },
};
</script>
