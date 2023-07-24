<template>
  <a href="#" class="IconDisplay c-any-card" @click.prevent="$emit('select')">
    <SwagIcon class="IconDisplay_icon" :icon="icon.name" :type="icon.mode" />
    <span class="IconDisplay_name">{{ icon.name }}</span>
  </a>
</template>

<script setup>
import {defineProps, computed} from 'vue';

const props = defineProps({
  icon: Object,
})

const id = computed(() => {
  return `meteor-icon-kit__${props.icon.mode}-${props.icon.name}`;
});
</script>

<style lang="scss">
.IconDisplay {
  display: flex;
  width: 100%;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 1rem;
  padding-top: 1rem;
  padding-bottom: 1rem;
  color: var(--vp-c-text-2);
  &_name,
  &_icon {
    color: var(--vp-c-text-2);
  }
  &_name {
    @apply text-xs;
  }
}
</style>
