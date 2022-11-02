<template>
  <modal>
    <template #modal-content>
      <div
        class="absolute top-0 right-0 w-1/4 h-screen py-12 items-start text-zinc-100 p-8 z-50 bg-zinc-900 shadow-2xl"
      >
        <div class="flex flex-nowrap">
          <span>
            <i
              class="fa fa-arrow-left cursor-pointer text-white text-xl font-bold pr-6"
              @click="$emit('close')"
            ></i>
          </span>
          <h3 class="text-lg mb-8">Add New Group</h3>
        </div>
        <h1 class="text-white text-2xl"></h1>

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
  </modal>
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
