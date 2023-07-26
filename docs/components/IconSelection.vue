<template>
  <div class="IconSelection_bg" @click.prevent="$emit('switch', null)"/>
  <div class="IconSelection c-flat-card p-8 relative" v-bind="$attrs">
    <div>
      <h3 @click.prevent="copyIconName">{{ icon.name }}</h3>
      <a class="IconSelection_close" href="#"
         @click.prevent="$emit('switch', null)">Close</a>

      <div class="IconSelection_tags" v-if="icon.tags.length">
        <span class="IconSelection_tag" v-for="tag in icon.tags">{{ tag }}</span>
      </div>

      <a :href="`${embedPoint}${icon.mode}/${icon.name}.svg`" class="btn --secondary" download>Download .svg</a>
    </div>

    <SwagIcon :icon="icon.name" :type="icon.mode" />

    <div>
      <h4>Sizes</h4>
      <p v-if="false && icon.sizes.length === 1">The icon is available in one size.</p>
      <div v-else class="flex gap-2">
        <button v-for="size in icon.sizes"
                type="button"
                @click.prevent="$emit('switch', {mode: icon.mode, basename: icon.basename, size})"
                :class="size === icon.size ? '--secondary' : '--subtle'"
                class="btn --secondary --xs">{{ size || 'default' }}
        </button>
      </div>
    </div>

    <div>
      <h4>Styles</h4>
      <p v-if="false && icon.modes.length === 1">The icon is available in one style.</p>
      <div v-else class="flex gap-2">
        <button v-for="mode in icon.modes"
                type="button"
                @click.prevent="$emit('switch', {mode, basename: icon.basename, size: icon.size})"
                :class="mode === icon.mode ? '--secondary' : '--subtle'"
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
      <div class="IconSelection_list">
        <IconDisplay
            v-for="icon in icons.slice(0, 4)"
            :key="icon"
            :icon="icon"
            @select="$emit('switch', icon)"/>
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

  &_close {
    @apply absolute right-0 top-0 mr-8 mt-8;
  }

  &_list {
    @apply grid gap-6;
    grid-template-columns: repeat(2, 1fr);
  }

  @media (max-width: 960.5px) {
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
  }

  @media (min-width: 960.5px) {
    &_bg {
      display: none;
    }
  }
}
</style>

<script setup>
import {computed} from "vue";
import IconDisplay from "./IconDisplay.vue"

const props = defineProps({
  icon: {},
  icons: {}
});

const exampleHTML = computed(() => props.icon ? `<SwagIcon name="${props.icon.name}" type="${props.icon.mode}" />` : null);
const exampleVue2 = computed(() => props.icon ? `<SwagIcon name="${props.icon.name}" type="${props.icon.mode}" />` : null);
const exampleVue3 = computed(() => props.icon ? `<SwagIcon name="${props.icon.name}" type="${props.icon.mode}" />` : null);
const exampleReact = computed(() => props.icon ? `<SwagIcon name="${props.icon.name}" type="${props.icon.mode}" />` : null);

const copyIconName = () => {
  const tempTextArea = document.createElement('textarea');
  tempTextArea.value = `${props.icon.regular ? 'regular-' : 'solid-'}${props.icon.name}`;
  document.body.appendChild(tempTextArea);
  tempTextArea.select();
  document.execCommand('copy');
  document.body.removeChild(tempTextArea);
}

const embedPoint = '/resources/meteor-icon-kit/public/icons/';
</script>