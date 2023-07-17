<template>
  <div class="IconSelection_bg" @click.prevent="$emit('deselect')"/>
  <div class="IconSelection c-flat-card p-8" v-bind="$attrs">
    <div>
      <h3>{{ icon.name }}</h3>
      <a class="IconSelection_close" href="#" @click.prevent="$emit('deselect')">Close</a>

      <div class="IconSelection_tags" v-if="iconMeta.tags.length">
        <span class="IconSelection_tag" v-for="tag in iconMeta.tags">{{ tag }}</span>
      </div>

      <a :href="icon.path" class="btn --secondary" download>Download .svg</a>
    </div>

    <SwagIcon :icon="icon.name" :type="iconMeta.mode" />

    <div>
      <h4>Sizes</h4>
      <p v-if="false && iconMeta.sizes.length === 1">The icon is available in one size.</p>
      <div v-else class="flex gap-2">
        <button v-for="size in iconMeta.sizes"
                type="button"
                @click.prevent="$emit('switch', {mode: iconMeta.mode, basename: iconMeta.basename, size})"
                :class="size === iconMeta.size ? '--secondary' : '--subtle'"
                class="btn --secondary --xs">{{ size || 'default' }}
        </button>
      </div>
    </div>

    <div>
      <h4>Styles</h4>
      <p v-if="false && iconMeta.modes.length === 1">The icon is available in one style.</p>
      <div v-else class="flex gap-2">
        <button v-for="mode in iconMeta.modes"
                type="button"
                @click.prevent="$emit('switch', {mode, basename: iconMeta.basename, size: iconMeta.size})"
                :class="mode === iconMeta.mode ? '--secondary' : '--subtle'"
                class="btn --secondary --xs">{{ mode }}
        </button>
      </div>
    </div>

    <div>
      <h4>Examples</h4>
      <Tabs>
        <Tab title="HTML">
          <code v-text="exampleHTML"></code>
        </Tab>
        <Tab title="Vue2">
          <code v-text="exampleVue2"></code>
        </Tab>
        <Tab title="Vue3">
          <code v-text="exampleVue3"></code>
        </Tab>
        <Tab title="React">
          <code v-text="exampleReact"></code>
        </Tab>
      </Tabs>
    </div>

    <div>
      <h4>Related icons</h4>
      <div class="SearchResult_list">
        <IconDisplay
            v-for="icon in icons.slice(0, 4)"
            :key="icon"
            :icon="icon"
            @selected="$emit('selected', icon)"/>
      </div>
    </div>

  </div>
</template>

<style lang="scss">
.IconSelection {
  @apply grid gap-6;
  &_tags {
    @apply flex flex-row gap-2;
  }

  &_tag {
    @apply bg-[var(--sw-c-gray-100)] text-[var(--sw-c-gray-dark-500)] text-sm px-2 py-1;
  }

  @media (max-width: 960px) {
    position: fixed;
    left: 50%;
    transform: translate(-50%, -50%);
    top: 50%;
    max-height: 75vh;
    max-width: 75vw;
    overflow: auto;
    z-index: 101;

    &_bg {
      position: fixed;
      content: '';
      display: block;
      background: rgba(0, 0, 0, 0.333);
      inset: 0;
      z-index: 100;
    }

    &_close {
      @apply absolute right-0 top-0 mr-8 mt-8;
    }
  }

  @media (min-width: 960.5px) {
    &_bg,
    &_close {
      display: none;
    }
  }
}
</style>

<script setup>
import {computed} from "vue";
// context of the developer portal
import meta from "../public/icons/meta.json";
import IconDisplay from "./IconDisplay.vue"

const props = defineProps({
  icon: {},
  icons: {}
});

const iconMeta = computed(() => props.icon ? meta.find(({name, mode}) => name === props.icon.name && mode === props.icon.mode) : null);

const exampleHTML = computed(() => props.icon ? `<SwagIcon name="${iconMeta.value.name}" mode="${iconMeta.value.mode}" />` : null);
const exampleVue2 = computed(() => props.icon ? `<SwagIcon name="${iconMeta.value.name}" mode="${iconMeta.value.mode}" />` : null);
const exampleVue3 = computed(() => props.icon ? `<SwagIcon name="${iconMeta.value.name}" mode="${iconMeta.value.mode}" />` : null);
const exampleReact = computed(() => props.icon ? `<SwagIcon name="${iconMeta.value.name}" mode="${iconMeta.value.mode}" />` : null);
</script>