<template>
  <div class="py-3">
    <form>
      <div class="flex flex-col">
        <div class="flex items-center w-48">
          <text-input
            type="text"
            placeholder="Add tax to product"
            label="Taxes"
          ></text-input>
          <span class="text-lg pr-3">
            <i class="fa fa-circle-question"></i>
          </span>
        </div>
        <div class="w-32">
          <text-input type="text" placeholder="Cost" label="Cost"></text-input>
        </div>
        <div class="flex items-center w-32">
          <text-input type="text" placeholder="Markup" label="Markup">
          </text-input
          >%
        </div>
        <div class="w-48">
          <text-input
            type="text"
            placeholder="Sale price"
            label="Sale price"
          ></text-input>
        </div>
      </div>
      <!-- END SECTION 1 CREATE PRODUCT -->
      <hr class="mt-6 border-b-1 border-zinc-600" />
      <div class="mb-2">
        <toggle-input target="pit" label="Price includes tax"></toggle-input>
      </div>
      <div class="mb-2">
        <toggle-input target="pca" label="Price change allowed"></toggle-input>
      </div>
    </form>
  </div>
</template>

<script>
import TextInput from "@/components/shared/forms/TextInput.vue";
import ToggleInput from "@/components/shared/forms/ToggleInput.vue";

export default {
  components: {
    TextInput,
    ToggleInput,
  },
  setup() {
    return {};
  },
};
</script>
